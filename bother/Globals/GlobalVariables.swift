//
//  GlobalVariables.swift
//  bother
//
//  Created by Eyüp Mert on 15.07.2022.
//

import Foundation


// Life is a road with bumps around. If we can share those, we can avoid or learn from them.

var isNewSession : Bool = true

var loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"
var botherArray = loremIpsum.components(separatedBy: ["!", ".", "?"])
var categoryArray : [String] = ["main.Technology".l10n(),
                                "main.Health".l10n(),
                                "main.Daily*Life".l10n(),
                                "main.Hobbies".l10n(),
                                "main.Transportation".l10n(),
                                "main.Restaurants*&*Cafes".l10n(),
                                "main.Business*Life".l10n(),
                                "main.Relationships".l10n(),
                                "main.Random".l10n()]

let languagesNames = ["English",
                      "Türkçe"]

let languagesCodes = ["en",
                      "tr"]
