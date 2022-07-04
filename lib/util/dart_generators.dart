/**
* Generator function example
* Generators a stream every 2 seconds
*/
Stream<int> boatStream() async* {
	for (int i=1; i<10; i+=1) {
		print("SENT boat no: ${i.toString()}");
		await Future.delayed(Duration(seconds:2));
		yield i;
	}	
}

void execute() async {
	Stream<int> stream = boatStream();
	// listen
	stream.listen((recievedData){
		print("Received boat no: ${recievedData.toString()}");
	});
}
