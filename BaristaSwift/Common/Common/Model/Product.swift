/*
  Product.swift
  Consumer

  Created by David Vieser on 1/30/18.

 Copyright (c) 2018-present, salesforce.com, inc. All rights reserved.
 
 Redistribution and use of this software in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright notice, this list of conditions
 and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of
 conditions and the following disclaimer in the documentation and/or other materials provided
 with the distribution.
 * Neither the name of salesforce.com, inc. nor the names of its contributors may be used to
 endorse or promote products derived from this software without specific prior written
 permission of salesforce.com, inc.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
 WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import Foundation
import SmartStore

public class Product: Record, StoreProtocol {
    public static let objectName: String = "Product2"
    
    public enum Field: String {
        case productId = "Id"
        case name = "Name"
        case featuredImageLeftURL = "FeaturedImageLeftURL__c"
        case featuredImageRightURL = "FeaturedImageRightURL__c"
        case iconImageURL = "IconImageURL__c"
        case isFeaturedItem = "FeaturedItem__c"
        case productDescription = "Description"
        case featuredItemPriority = "FeaturedItemPriority__c"
        
        static let allFields = [productId.rawValue, name.rawValue, featuredImageLeftURL.rawValue, featuredImageRightURL.rawValue, iconImageURL.rawValue, isFeaturedItem.rawValue, productDescription.rawValue, featuredItemPriority.rawValue]
    }

    public fileprivate(set) lazy var productId: String? = data[Field.productId.rawValue] as? String
    public fileprivate(set) lazy var name: String? = data[Field.name.rawValue] as? String
    public fileprivate(set) lazy var featuredImageLeftURL: String? = data[Field.featuredImageLeftURL.rawValue] as? String
    public fileprivate(set) lazy var featuredImageRightURL: String? = data[Field.featuredImageRightURL.rawValue] as? String
    public fileprivate(set) lazy var iconImageURL: String? = data[Field.iconImageURL.rawValue] as? String
    public fileprivate(set) lazy var isFeaturedItem: String? = data[Field.isFeaturedItem.rawValue] as? String
    public fileprivate(set) lazy var productDescription: String? = data[Field.productDescription.rawValue] as? String
    public fileprivate(set) lazy var featuredItemPriority: String? = data[Field.featuredItemPriority.rawValue] as? String

    public override static var indexes: [[String : String]] {
        return super.indexes + [
            ["path" : Field.productId.rawValue, "type" : kSoupIndexTypeString],
            ["path" : Field.name.rawValue, "type" : kSoupIndexTypeString],
            ["path" : Field.featuredImageLeftURL.rawValue, "type" : kSoupIndexTypeString],
            ["path" : Field.featuredImageRightURL.rawValue, "type" : kSoupIndexTypeString],
            ["path" : Field.iconImageURL.rawValue, "type" : kSoupIndexTypeString],
            ["path" : Field.isFeaturedItem.rawValue, "type" : kSoupIndexTypeString],
            ["path" : Field.featuredItemPriority.rawValue, "type" : kSoupIndexTypeString],
            ["path" : Field.productDescription.rawValue, "type" : kSoupIndexTypeString],
        ]
    }
    
    public override static var readFields: [String] {
        return super.readFields + Field.allFields
    }
    public override static var createFields: [String] {
        return super.createFields + Field.allFields
    }
    public override static var updateFields: [String] {
        return super.updateFields + Field.allFields
    }
    
    public static var orderPath: String = Field.name.rawValue
}