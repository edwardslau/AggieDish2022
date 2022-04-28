import Foundation
import SwiftProtobuf
import GRPC
import NIOCore
import NIOPosix
import CoreLocation

func setupClient(host: String, port: Int)-> Model_ServiceClient{

	let event = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
	let channel = ClientConnection
		.insecure(group: event)
		.connect(host: host, port: port)
	
	return Model_ServiceClient(channel: channel)
}

func getEatery(client: Model_ServiceClient, lat: Double , lng: Double) -> [EateryCard]{
	
	var coordinates = Google_Type_LatLng()
	coordinates.longitude = lng
	coordinates.latitude = lat
	print("→ GetFeature: lat=\(lat) lon=\(lng)")

	let request = Model_GetEateriesRequest.with {
		$0.userCoordinates = coordinates
		$0.maxDistance = 1000.0
	}
	print("REQUEST")
	print(request)
	var newCards = [EateryCard]()
	
	let call = client.getEateries(request)
	call.response.whenSuccess{response in
		print("Call Succeeded with response\n\(response)")
			for eatery in response.eateries{
              var dayOpenIn = [DayOpen]()
              var timeRangeIn = [TimeRange]()
              
              for dayOpen in eatery.dayOpen {
                timeRangeIn = [TimeRange]()
                for timeRange in dayOpen.timeRangeOpen {
                  timeRangeIn.append(TimeRange(openTime: timeRange.openTime, closeTime: timeRange.closeTime))
                }
                dayOpenIn.append(DayOpen(dayOpen: timeRangeIn))
              }
              
              
              var menuDayIn = [MenuDay]()
              for menuDay in eatery.menu.menuDay {
                var foodProductIn = [FoodProduct]()
                for product in menuDay.foodProduct {
                  var customizationIn = [Customization]()
                  for customization in product.customization {
                    var choices = [CustomizationChoice]()
                    for choice in customization.choices {
                      choices.append(CustomizationChoice(name: choice.name,
                                                         price: choice.price))
                    }
                    customizationIn.append(Customization(category: customization.category,
                                                         minPick: customization.minPick,
                                                         maxPick: customization.maxPick,
                                                         choices: choices))
                  }
                  var ingredientsIn = [Ingredient]()
                  for ingredient in product.ingredients {
                    ingredientsIn.append(Ingredient(name: ingredient.name))
                  }
                  var allergensIn = [Allergen]()
                  for allergen in product.allergens {
                    allergensIn.append(Allergen(name: allergen.name))
                  }
                  
                  foodProductIn.append(FoodProduct(id: product.id,
                                                   name: product.name,
                                                   price: product.price,
                                                   customization: customizationIn,
                                                   description: product.description_p,
                                                   ingredients: ingredientsIn,
                                                   allergens: allergensIn))
                }
                menuDayIn.append(MenuDay(day: menuDay.day, foodProduct: foodProductIn))
              }
              var menuIn = MenuModel(menuDay: menuDayIn)
              
//              eatery.menu
              var newEatery = EateryCard(id: eatery.id.value,
                                         restaurantName: eatery.name.value,
                                         location: eatery.location.value,
                                         restaurantImage: eatery.imageURL.value,
                                         dayOpen: dayOpenIn,
                                         menu: menuIn,
                                         description: eatery.description_p.value,
                                         pickupLocation: eatery.pickupLocation.value)
//              newEatery.category = eatery.category.value
              newCards.append(newEatery)
			}
		}
	call.response.whenFailure { error in
		print("CALL FAILED WITH ERROR\n\(error)")
	}

	
	sleep(1)
	//print(newCards)
	return newCards
}

func getFoodProducts(id: Google_Protobuf_StringValue, serviceClient: Model_ServiceClient){
	
	let request = Model_GetEateryFoodProductsRequest.with {
		$0.eateryID = id;
	}

	let call = serviceClient.getEateryFoodProducts(request)
	
	call.response.whenSuccess{ response in
		print("Call Succeeded with response\n\(response)")
	}
	call.response.whenFailure { error in
		print("CALL FAILED WITH ERROR\n\(error)")
	  }
}

func startClient()->Model_ServiceClient{
	let group = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
	
	defer {
		try! group.syncShutdownGracefully()
	}
	
	let client: Model_ServiceClient = setupClient(host: "localhost", port: 8980)

	//getFoodProducts(id: "default", serviceClient: client)
	return client

}
