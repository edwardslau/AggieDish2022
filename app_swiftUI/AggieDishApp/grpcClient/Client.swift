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
				var newEatery = EateryCard()
				newEatery.id = Int(eatery.mid.value)
				newEatery.restaurantName = eatery.name.value
				newEatery.restaurantImage = eatery.imageURL.value
				newEatery.category = eatery.category.value
				newEatery.openHours = eatery.openHours.value
				newEatery.pickupLocation = eatery.pickupLocation.value
				newEatery.description = eatery.description_p.value
				newEatery.expectPickupTime = eatery.expectedPickupTime.value
				newEatery.location = eatery.location.value
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
