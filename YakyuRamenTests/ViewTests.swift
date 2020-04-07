////
////  ViewTests.swift
////  YakyuRamenTests
////
////  Created by Ronaldo Junior on 15/03/20.
////  Copyright © 2020 Gabriel. All rights reserved.
////
//
//import Foundation
////import Quick
//import Nimble
//import SnapshotTesting
//import SnapshotTesting_Nimble
//
//@testable import Yakyu_Ramen
//
//class ViewTests: QuickSpec {
//    
//    let leagueTableView = LeagueTableViewController()
//    let launchScreenVC = LaunchScreenViewController()
//    //let appBundle = Bundle(for: type(of: LaunchScreenViewController) as! LaunchScreenViewController)
//    
//    let devices = [("iPhoneX_portrait", ViewImageConfig.iPhoneX(.portrait)),
//                   ("iPhoneSe_portrait", ViewImageConfig.iPhoneSe(.portrait)),
//                   ("iPhone8Plus_portrait", ViewImageConfig.iPhone8Plus(.portrait)),
//
//                   ("iPhoneXsMax_portrait", ViewImageConfig.iPhoneXsMax(.portrait))]
//    
//     override func spec() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard
//            .instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
//        
//        beforeEach {
//            viewController.view.layoutSubviews()
//            viewController.beginAppearanceTransition(true, animated: false)
//        }
//        
//
//        it("should show loginButton if user set username and password") {
//            
//            expect(viewController.view) == recordSnapshot()
//        }
//        
//        
//    }
//
////    override func setUp() {
////
////
////
////
//////        launchScreenVC.loadView()
//////        let _ = launchScreenVC.view
////       // launchScreenVC.viewDidLoad()
////
//////        leagueTableView.viewDidLoad()
//////        leagueTableView.loadView()
//////        let _ = leagueTableView.view
////
////
////
//////        // Test and Load the View at the Same Time!
//////        XCTAssertNotNil(navigationController.view)
//////        XCTAssertNotNil(currentViewController.view)
////    }
////
////
////
////    override func tearDown() {
////        // Put teardown code here. This method is called after the invocation of each test method in the class.
////    }
////
////    func testExample() {
////        // This is an example of a functional test case.
////        // Use XCTAssert and related functions to verify your tests produce the correct results.
////    }
////
////    func testViewInMultipleDevices(viewController: UIViewController, devices: [(String, ViewImageConfig)]) {
////        for (name, config) in devices {
////            assertSnapshot(matching: viewController, as: .image(on: config), named: name)
////        }
////    }
////
////    func testLaunchScreenViewController() {
////        let formViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController() as! LaunchScreenViewController
////        formViewController.view.layoutSubviews() //init outlets
////
////        UIScreen.main.setValue(2.0, forKeyPath: "scale")
////        testViewInMultipleDevices(viewController: formViewController, devices: devices)
////    }
////
////    func testView() {
////      //record = true
////
////        let storyboard = UIStoryboard(name: "Main",
////                                      bundle: Bundle.main)
////        let currentViewController = storyboard.instantiateInitialViewController() as! LaunchScreenViewController
////
////        currentViewController.loadView()
////        let _ = currentViewController.view
////
////
////        currentViewController.beginAppearanceTransition(true, animated: true)
////
////
////        assertSnapshot(matching: currentViewController, as: .image, record: false)
////        assertSnapshot(matching: currentViewController, as: .image(on: .iPhoneXsMax))
////        currentViewController.endAppearanceTransition()
////        //assertSnapshot(matching: launchScreenVC, as: .image(on: .iPhoneXsMax))
////        //assertSnapshot(matching: launchScreenVC.view, as: .image(on: .iPhoneSe))
////
////
////    }
////
////    func testStoredView() {
////
////        let storyboard = UIStoryboard(name: "Main",
////                                      bundle: Bundle.main)
////        let navController =  storyboard.instantiateViewController(identifier: "pacificLeagueTable") as! UINavigationController
////
////        if let currentViewController = navController.topViewController {
////
////                //pacificLeagueTable
////            currentViewController.loadView()
////            let _ = currentViewController.view
////
////
////            currentViewController.beginAppearanceTransition(true, animated: true)
////
////
////            assertSnapshot(matching: currentViewController, as: .image, record: false)
////            currentViewController.endAppearanceTransition()
////
////        }
////
////
////        //assertSnapshot(matching: launchScreenVC, as: .image(on: .iPhoneXsMax))
////        //assertSnapshot(matching: launchScreenVC.view, as: .image(on: .iPhoneSe))
////
////
////    }
////
////    func testLeagueTableView() {
////
////        let storyboard = UIStoryboard(name: "Main", bundle: nil)
////        let viewController = storyboard
////            .instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
////
////        viewController.beginAppearanceTransition(true, animated: false)
////
////        //assertSnapshot(matching: viewController, as: .image, record: false)
////        UIScreen.main.setValue(2.0, forKeyPath: "scale")
////        testViewInMultipleDevices(viewController: viewController, devices: devices)
////        viewController.endAppearanceTransition()
////    }
////
////    func testCentralLeagueTableView() {
////
////        let storyboard = UIStoryboard(name: "Main", bundle: nil)
////        let viewController = storyboard
////            .instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
////
////        viewController.view.layoutSubviews()
////        //UIScreen.main.setValue(2.0, forKeyPath: "scale")
////        viewController.beginAppearanceTransition(true, animated: false)
////
////        //assertSnapshot(matching: viewController, as: .image, record: false)
////
////        //let device = devices
////        for (name, config) in devices {
////            assertSnapshot(matching: viewController, as: .image(on: config), named: name)
////        }
////        viewController.endAppearanceTransition()
////    }
//
//
//}
//
