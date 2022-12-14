//
//  CustomData.swift
//
//  PubNub Real-time Cloud-Hosted Push API and Push Notification Client Frameworks
//  Copyright © 2021 PubNub Inc.
//  https://www.pubnub.com/
//  https://www.pubnub.com/terms
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

import PubNub

public protocol CustomFlatJSONData: FlatJSONCodable, Hashable, Defaultable {}
public protocol CustomJSONData: JSONCodable, Hashable, Defaultable {}

public struct VoidCustomData: Codable, Hashable,
  ChatCustomData,
  UserCustomData,
  ChannelCustomData,
  MemberCustomData,
  MessageCustomData,
  MessageContentData
{
  public init() {}
  public init(flatJSON: [String: JSONCodableScalar]) { }
  public var flatJSON: [String: JSONCodableScalar] { [:] }
}

public protocol UserCustomData: CustomFlatJSONData {}
public protocol ChannelCustomData: CustomFlatJSONData {}
public protocol MemberCustomData: CustomFlatJSONData {}
public protocol MessageCustomData: CustomJSONData {}
public protocol MessageContentData: CustomJSONData {}

public protocol ChatCustomData {
  associatedtype User: UserCustomData = VoidCustomData
  associatedtype Channel: ChannelCustomData = VoidCustomData
  associatedtype Member: MemberCustomData = VoidCustomData
  associatedtype Message: MessageCustomData = VoidCustomData
  associatedtype MessageContent: MessageContentData = VoidCustomData
}

public protocol Defaultable {
  init()
}
