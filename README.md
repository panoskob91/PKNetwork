# PKNetwork

PKNetwork is a wrapper on top of NSUrlSessionDataTask, used to perform and manage http/https request and responses, currenty supporting iOS and MacOS.

## Instalation

PKNetwork is deployed as a cocoa pod. In order to install the pod add to your podfile the following: 
```Ruby
pod 'PKNetwork'
```
To install the pod, open your terminal, navigate to the project folder and run the command
```Ruby
pod install
```

## How to use

This framework uses three main classes:
*  PKRequest: The class managing http/https request
*  PKResponse: The object managing http/https responses
*  Communicator: The object responsible of performing server calls  

So, to perform the first request, firstly we need to create a PKRquest object. To do so we need four parameters
* Request method: The http/https method, currently supporting GET, POST, PUT, DELETE methods.
* Request headers: A dictionary with the needed request headers.
* Request Url: A url object containign the url of the reques.
* Request body: A dictionary containing the request payload. Can be set to nil if no body is needed.

```Swift
let requestHeaders: [AnyHashable: Any] = ["application": "json"]
let method = PKRequestMethod.GET
let request = PKRequest(requestHeaders: requestHeaders,
                        andRequestBody: nil, 
                        andRequest: requestURL, 
                        andRequestMethod: method)
```

Now that a request object is created, we need to perform the request. To do so we need the Communicator class. We create a shared Communicator object and then call the fetch method.

```Swift
let communicatorShared = PKCommunicator.sharedInstance()
communicatorShared.fetchData(with: request,
                            onSuccess: { (successResponse) in
                                        //successResponse is a PKResponse object, containing server response data. We perform any data manipulations needed and passed the object to the callback.
                                        success(objectToBePassed)
        }) { (failResponse) in
            //failResponse is a PKResponse object containing server error response data.
            failure(failResponse)
        }
```

The PKResopnse object has the following properties:
``` objective c
@property (strong, nonatomic)  id _Nullable responseObject;
@property (strong, nonatomic) NSDictionary * _Nullable responseHeaders;
@property (nonatomic, assign) enum PKResponseStatus responseStatus;
```

PKResponseStatus is an enum mapping response status from ints to more readable values. If the int value is needed the method statusCodeFrom can be used like so
```Swift
let statusCode = responseObject.statusCodeFrom(responseObject.responseStatus)
```
and vice versa

```Swift
let responseStatus: PKResponseStatus = responseObject.responseStatusFromCode(@200)//Or any other status code needed.
```

