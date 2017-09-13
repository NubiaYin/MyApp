//
//  MANetowrkEngine.swift
//  MyApp
//
//  Created by 尹健 on 2017/9/12.
//  Copyright © 2017年 nubia. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias MARequestSuccess = (_:URLRequest?, _ data:[String:Any]?) -> Void
typealias MARequsetFailed = (_:URLRequest?, _ error:NSError) -> Void
typealias MANEAnalyzeResult = (result:[String:Any]?,error:NSError?)

let MANEAnalyzeError = NSError.init(domain: "解析错误", code: 10000, userInfo: nil)

protocol MANetworkEngineMethod {
    static func request(url:URLConvertible, method:HTTPMethod, param:[String:Any]?,success:@escaping MARequestSuccess,failed:@escaping MARequsetFailed) -> URLRequest
}

public class MANetworkEngine {
    
}

extension MANetworkEngine : MANetworkEngineMethod {
    static func request(url: URLConvertible, method: HTTPMethod, param: [String : Any]?, success: @escaping MARequestSuccess, failed: @escaping MARequsetFailed) -> URLRequest {
        return Alamofire.request(url, method: method, parameters: param, encoding: JSONEncoding.default, headers: nil).response(queue: nil, completionHandler: { (response) in
            let result = analyzeData(data: response.data ?? Data())
            if let aError = result.error {
                failed(response.request, aError)
            }
            else
            {
                success(response.request,result.result)
            }
            
        }).request!
    }

    static func analyzeData(data:Data) -> MANEAnalyzeResult {
        var result = MANEAnalyzeResult(nil,nil)
        
        guard let resultInfo:[String : Any] = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : Any] else {
            result.error = NSError.init(domain: "", code: 1, userInfo: nil)
            return result
        }
        
        var state = -1
        var msg = ""
        
        if let aState = resultInfo["state"] as? Int {
            state = aState
        }
        
        if  let aMsg = resultInfo["msg"] as? String {
            msg = aMsg
        }
        
        if state != 0 {
            result.error = NSError.init(domain: msg, code: state, userInfo: nil)
            return result
        }
        
        if let aInfo = resultInfo["data"] as? [String : Any]{
            result.result = aInfo
        }
        else
        {
            result.error = MANEAnalyzeError
        }
        
        return result
    }
}
