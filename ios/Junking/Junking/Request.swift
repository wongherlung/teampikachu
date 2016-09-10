import Foundation

func HTTPsendRequest(request: NSMutableURLRequest,callback: (String, String?) -> Void) {

    let task = NSURLSession.sharedSession().dataTaskWithRequest(request,completionHandler :
        {
            data, response, error in
            if error != nil {
                callback("", (error!.localizedDescription) as String)
            } else {
                callback(NSString(data: data!, encoding: NSUTF8StringEncoding) as! String,nil)
            }
    })

    task.resume()
}

func HTTPGet(url: String, callback: (String, String?) -> Void) {
    let request = NSMutableURLRequest(URL: NSURL(string: url)!) //To get the URL of the receiver , var URL: NSURL? is used
    HTTPsendRequest(request, callback: callback)
}

func HTTPPost(url: String, data: Dictionary<String, String>, callback: (String, String?) -> Void) {
    let request = NSMutableURLRequest(URL: NSURL(string: url)!)
    request.HTTPMethod = "POST"
    request.HTTPBody = convertToPostData(data)
    HTTPsendRequest(request, callback: callback)
}

func HTTPPut(url: String, data: Dictionary<String, String>, callback: (String, String?) -> Void) {
    let request = NSMutableURLRequest(URL: NSURL(string: url)!)
    request.HTTPMethod = "PUT"
    request.HTTPBody = convertToPostData(data)
    HTTPsendRequest(request, callback: callback)
}

func convertToPostData(data: Dictionary<String, String>) -> NSData {
    var stringData = ""
    for (key, value) in data {
        stringData += "&\(key)=\(value)"
    }

    return stringData.dataUsingEncoding(NSUTF8StringEncoding)!
}
