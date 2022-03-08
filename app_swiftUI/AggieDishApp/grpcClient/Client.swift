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

func getEatery(client: Model_ServiceClient, lat: Double , lng: Double){
	
	var coordinates = Google_Type_LatLng()
	coordinates.longitude = lng
	coordinates.latitude = lat
	print("→ GetFeature: lat=\(lat) lon=\(lng)")

	//let response: Model_GetEateriesResponse
	let request = Model_GetEateriesRequest.with {
		$0.userCoordinates = coordinates
		$0.maxDistance = 1000.0
	}
	print("REQUEST")
	print(request)

	do{
		let call = client.getEateries(request)
		call.response.whenSuccess{response in
		print("Call Succeeded with response\n\(response)")
		}
		call.response.whenFailure { error in
			print("CALL FAILED WITH ERROR\n\(error)")
		  }
	}
}

func getFoodProducts(id: Google_Protobuf_StringValue, serviceClient: Model_ServiceClient){
	
	let request = Model_GetFoodProductRequest.with {
		$0.eateryID = id;
	}
	
	//let response: Model_GetFoodProductResponse
	//var menu = [Model_FoodProduct].self

	let callOptions = CallOptions()
	//let new = Model_ServiceClient.addEatery()
	let call = serviceClient.getFoodProduct(request, callOptions: callOptions)
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
	getFoodProducts(id: "Default Food Product", serviceClient: client)
	return client
	
	//  getEatery(client: client, lat: lat, lng: lng)
    //  getFoodProducts(id: "Default Food Product", serviceClient: client)
}
