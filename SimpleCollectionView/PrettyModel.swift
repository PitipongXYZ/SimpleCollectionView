//
//  PrettyModel.swift
//
//  Created by Manao on 4/25/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class PrettyModel: NSObject, Mappable, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kPrettyModelErrorKey: String = "error"
	internal let kPrettyModelResultsKey: String = "results"


    // MARK: Properties
	public var error: Bool = false
	public var results: [Results]?


    // MARK: SwiftyJSON Initalizers
    /**
    Initates the class based on the object
    - parameter object: The object of either Dictionary or Array kind that was passed.
    - returns: An initalized instance of the class.
    */
    convenience public init(object: AnyObject) {
        self.init(json: JSON(object))
    }

    /**
    Initates the class based on the JSON that was passed.
    - parameter json: JSON object from SwiftyJSON.
    - returns: An initalized instance of the class.
    */
    public init(json: JSON) {
		error = json[kPrettyModelErrorKey].boolValue
		results = []
		if let items = json[kPrettyModelResultsKey].array {
			for item in items {
				results?.append(Results(json: item))
			}
		} else {
			results = nil
		}

    }

    // MARK: ObjectMapper Initalizers
    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    required public init?(_ map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		error <- map[kPrettyModelErrorKey]
		results <- map[kPrettyModelResultsKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		dictionary.updateValue(error, forKey: kPrettyModelErrorKey)
		if results?.count > 0 {
			var temp: [AnyObject] = []
			for item in results! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kPrettyModelResultsKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.error = aDecoder.decodeBoolForKey(kPrettyModelErrorKey)
		self.results = aDecoder.decodeObjectForKey(kPrettyModelResultsKey) as? [Results]

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeBool(error, forKey: kPrettyModelErrorKey)
		aCoder.encodeObject(results, forKey: kPrettyModelResultsKey)

    }

}
