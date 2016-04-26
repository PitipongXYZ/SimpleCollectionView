//
//  Results.swift
//
//  Created by Manao on 4/25/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class Results: NSObject, Mappable, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kResultsSourceKey: String = "source"
	internal let kResultsInternalIdentifierKey: String = "_id"
	internal let kResultsWhoKey: String = "who"
	internal let kResultsDescKey: String = "desc"
	internal let kResultsPublishedAtKey: String = "publishedAt"
	internal let kResultsUsedKey: String = "used"
	internal let kResultsCreatedAtKey: String = "createdAt"
	internal let kResultsUrlKey: String = "url"
	internal let kResultsTypeKey: String = "type"


    // MARK: Properties
	public var source: String?
	public var internalIdentifier: String?
	public var who: String?
	public var desc: String?
	public var publishedAt: String?
	public var used: Bool = false
	public var createdAt: String?
	public var url: String?
	public var type: String?


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
		source = json[kResultsSourceKey].string
		internalIdentifier = json[kResultsInternalIdentifierKey].string
		who = json[kResultsWhoKey].string
		desc = json[kResultsDescKey].string
		publishedAt = json[kResultsPublishedAtKey].string
		used = json[kResultsUsedKey].boolValue
		createdAt = json[kResultsCreatedAtKey].string
		url = json[kResultsUrlKey].string
		type = json[kResultsTypeKey].string

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
		source <- map[kResultsSourceKey]
		internalIdentifier <- map[kResultsInternalIdentifierKey]
		who <- map[kResultsWhoKey]
		desc <- map[kResultsDescKey]
		publishedAt <- map[kResultsPublishedAtKey]
		used <- map[kResultsUsedKey]
		createdAt <- map[kResultsCreatedAtKey]
		url <- map[kResultsUrlKey]
		type <- map[kResultsTypeKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if source != nil {
			dictionary.updateValue(source!, forKey: kResultsSourceKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier!, forKey: kResultsInternalIdentifierKey)
		}
		if who != nil {
			dictionary.updateValue(who!, forKey: kResultsWhoKey)
		}
		if desc != nil {
			dictionary.updateValue(desc!, forKey: kResultsDescKey)
		}
		if publishedAt != nil {
			dictionary.updateValue(publishedAt!, forKey: kResultsPublishedAtKey)
		}
		dictionary.updateValue(used, forKey: kResultsUsedKey)
		if createdAt != nil {
			dictionary.updateValue(createdAt!, forKey: kResultsCreatedAtKey)
		}
		if url != nil {
			dictionary.updateValue(url!, forKey: kResultsUrlKey)
		}
		if type != nil {
			dictionary.updateValue(type!, forKey: kResultsTypeKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.source = aDecoder.decodeObjectForKey(kResultsSourceKey) as? String
		self.internalIdentifier = aDecoder.decodeObjectForKey(kResultsInternalIdentifierKey) as? String
		self.who = aDecoder.decodeObjectForKey(kResultsWhoKey) as? String
		self.desc = aDecoder.decodeObjectForKey(kResultsDescKey) as? String
		self.publishedAt = aDecoder.decodeObjectForKey(kResultsPublishedAtKey) as? String
		self.used = aDecoder.decodeBoolForKey(kResultsUsedKey)
		self.createdAt = aDecoder.decodeObjectForKey(kResultsCreatedAtKey) as? String
		self.url = aDecoder.decodeObjectForKey(kResultsUrlKey) as? String
		self.type = aDecoder.decodeObjectForKey(kResultsTypeKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(source, forKey: kResultsSourceKey)
		aCoder.encodeObject(internalIdentifier, forKey: kResultsInternalIdentifierKey)
		aCoder.encodeObject(who, forKey: kResultsWhoKey)
		aCoder.encodeObject(desc, forKey: kResultsDescKey)
		aCoder.encodeObject(publishedAt, forKey: kResultsPublishedAtKey)
		aCoder.encodeBool(used, forKey: kResultsUsedKey)
		aCoder.encodeObject(createdAt, forKey: kResultsCreatedAtKey)
		aCoder.encodeObject(url, forKey: kResultsUrlKey)
		aCoder.encodeObject(type, forKey: kResultsTypeKey)

    }

}
