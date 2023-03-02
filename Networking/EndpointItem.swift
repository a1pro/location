////
////  EndpointItem.swift
////  CartoonMe
////
////  Created by iApp on 15/07/22.
////
//
//import Foundation
////import Alamofire
//
//
///// `api` endpoints  ---  defination for the current table to the server
///// server path has end points for every hit
//protocol EndPointType {
//    /// this is the  server base path for every requst
//    /// this could be three typ
//    /// `Production` :- used for global base server path for production user only
//    /// `Sanbox`:- used for development purpose only for the developers
//    var baseURL: String { get }
//        
//    /// this is the  server base path for every requst
//    /// currently we are using two base path
//    /// `dmBasePath` DM has different base path for all its endpoints
//    /// `Production` :- used for global base server path for production user only
//    
//    
//    /// this is DM base `url`
//    /// all endpoints related to `DM` will work with this base path
////    var dmBaseURL: String { get }
//    
//    /// appending path for the base url
//    var path: String { get }
//    
//    /// `HTTP METHOD` defines the request type for the server for specific queries
//    var httpMethod: HTTPMethod { get }
//    
//    /// some params need for authentication or other thing
//    /// that will hold by headers
//    var headers: HTTPHeaders? { get }
//    
//    // complete url for the server request
//    var url: URL { get }
//    
//    /// encoding type for the current api
//    var encoding: ParameterEncoding { get }
//    
//    /// api version
//    var version: String { get }
//}
//
//
//
///// items that define here for every api
///// like login signup etc.
//enum EndpointItem {
//    case cartoonSelfie(_: String) // Create Cartoon
//    case matting(_ mattingType: String)         // Enhance Photo
//    case imageFix
//}
//
//// MARK: - Extensions
//// MARK: - EndPointType
//extension EndpointItem: EndPointType {
//    /// this depend on network `enviroment`
//    /// impediatly give the base url for selected enviroment
//    var baseURL: String {
//        switch APIManager.networkEnviroment {
//            case .dev: return "https://www.cutout.pro/api/v1/"
//            case .production: return "https://www.cutout.pro/api/v1/"
//            case .stage: return "https://www.cutout.pro/api/v1/"
//        }
//    }
//
//    /// will give the version to end point
//    var version: String {
//        return "/v0"
//    }
//    var path: String {
//        switch self {
//        case .cartoonSelfie(let cartoonType):
//            return "cartoonSelfie?cartoonType=\(cartoonType)"
//        case .matting(let mattingType):
//            return "matting?mattingType=\(mattingType)"
//        case .imageFix:
//            return "imageFix"
//        }
//    }
//
//    var httpMethod: HTTPMethod {
//        switch self {
//        case .cartoonSelfie, .matting,.imageFix:
//            return .post
//        }
//    }
//    
//    var headers: HTTPHeaders? {
//        switch self {
//        case .cartoonSelfie, .matting:
//            return ["APIKEY": API.MainAPIkey,
//                    "Content-Type": "multipart/form-data"]
//        case .imageFix:
//           return ["APIKEY": API.MainAPIkey,
//                    "Content-Type": "application/json"]
//        }
//    }
//    
//    var url: URL {
//        switch self {
//        default:
//            return URL(string: self.baseURL + self.path)!
//        }
//    }
//    
//    var encoding: ParameterEncoding {
//        switch self {
//        default:
//            return JSONEncoding.default
//        }
//    }
//}
