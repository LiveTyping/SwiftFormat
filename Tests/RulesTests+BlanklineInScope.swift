//
//  BlanklineInScopeTests.swift
//  SwiftFormatTests
//
//  Created by Nikita Velichkin on 09/07/2020.
//  Copyright © 2020 Nick Lockwood. All rights reserved.
//

import XCTest
@testable import SwiftFormat

class BlanklineInScopeTests: XCTestCase {
    // MARK: - Space in start/end of scope

    func testBlankLineAtStartOfScope() {
        let input = """
        struct Foo {
            var a: Int?
            var b: String?

            func b() {
                var d: Int?
            }
        }
        """

        let output = """
        struct Foo {

            var a: Int?
            var b: String?

            func b() {
                var d: Int?
            }

        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlankLineAtStartOfScope_expectNoFormatting() {
        let input = """
        struct Foo {

            var a: Int?
            var b: String?

            func b() {
                var d: Int?
            }

        }
        """

        let output = """
        struct Foo {

            var a: Int?
            var b: String?

            func b() {
                var d: Int?
            }

        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlankLineAtStartOfScope_expectFormatAtStart() {
        let input = """
        struct Foo {
            var a: Int?
            var b: String?

            func b() {
                var d: Int?
            }

        }
        """

        let output = """
        struct Foo {

            var a: Int?
            var b: String?

            func b() {
                var d: Int?
            }

        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlankLineAtStartOfScope_expectFormatAtEnd() {
        let input = """
        struct Foo {

            var a: Int?
            var b: String?

            func b() {
                var d: Int?
            }
        }
        """

        let output = """
        struct Foo {

            var a: Int?
            var b: String?

            func b() {
                var d: Int?
            }

        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlankLineAtStartOfScope_expectNoFormatSwitch() {
        let input = """
        struct Foo {

            func b() {
                switch self {
                    default:
                        break
                }
            }

        }
        """

        let output = """
        struct Foo {

            func b() {
                switch self {
                    default:
                        break
                }
            }

        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlankLineAtStartOfScope_NoFormatProtocolWithGetter() {
        let input = """
        protocol A {
            var b: Int { get }
        }
        """

        let output = """
        protocol A {
            var b: Int { get }
        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlankLineAtStartOfScope_NoFormatClassFunc() {
        let input = """
        override class func foo() -> String? {
            return ""
        }
        """

        let output = """
        override class func foo() -> String? {
            return ""
        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlankLineAtStartOfScope_NoFormatProtocolClass() {
        let input = """
        protocol A: AnyObject {
            func bar()
        }
        """

        let output = """
        protocol A: AnyObject {
            func bar()
        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlankLineAtStartOfScope_FormatStructWithoutFunc() {
        let input = """
        struct A {
            var bar = ""
        }
        """

        let output = """
        struct A {

            var bar = ""

        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlanklinesInsideProtocolExtension() {
        let input = """
        protocol IsPresenter {
            associatedtype Input
            associatedtype Output

            func bindInput(_ input: Input)
            func configureOutput(_ input: Input) -> Output

            func buildOutput(with input: Input) -> Output
        }

        extension IsPresenter {
            func buildOutput(with input: Input) -> Output {
                bindInput(input)

                let output = configureOutput(input)
                return output
            }
        }
        """

        let output = """
        protocol IsPresenter {
            associatedtype Input
            associatedtype Output

            func bindInput(_ input: Input)
            func configureOutput(_ input: Input) -> Output

            func buildOutput(with input: Input) -> Output
        }

        extension IsPresenter {

            func buildOutput(with input: Input) -> Output {
                bindInput(input)

                let output = configureOutput(input)
                return output
            }

        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlankLinesInStruct_noSpacing() {
        let input = """
        struct Input {
            var startDetect: Observable<Void>
        }
        """

        let output = """
        struct Input {

            var startDetect: Observable<Void>

        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlankLines_emptyExtension() {
        let input = """
        extension DeviceInfoCollection: RegistrationModel {}
        """

        let output = """
        extension DeviceInfoCollection: RegistrationModel {}
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlankLinesInStruct() {
        let input = """
        struct Input {

            var startDetect: Observable<Void>
        }
        """

        let output = """
        struct Input {

            var startDetect: Observable<Void>

        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testGuardLet() {
        let input = """
        func setNavigationBarHidden(_ isHidden: Bool, animated: Bool) {
                guard let navigationController = navigationController else { return }

                navigationController.setNavigationBarHidden(isHidden, animated: animated)
        }
        """

        let output = """
        func setNavigationBarHidden(_ isHidden: Bool, animated: Bool) {
                guard let navigationController = navigationController else { return }

                navigationController.setNavigationBarHidden(isHidden, animated: animated)
        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testStructWithoutFuncs() {
        let input = """
        struct Input {

            let eventName: Observable<String>
            let selectPlace: Observable<Void>
            let isAllDay: Observable<Bool>
        }
        """

        let output = """
        struct Input {

            let eventName: Observable<String>
            let selectPlace: Observable<Void>
            let isAllDay: Observable<Bool>

        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testStructWithoutFuncs_notFormat() {
        let input = """
        struct Input {

            let eventName: Observable<String>
            let selectPlace: Observable<Void>
            let isAllDay: Observable<Bool>

        }
        """

        let output = """
        struct Input {

            let eventName: Observable<String>
            let selectPlace: Observable<Void>
            let isAllDay: Observable<Bool>

        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

//    func testBlanklineAfterCallSuper() {
//        let input = """
//        override func foo() {
//            super.foo()
//
//            bar()
//        }
//        """
//
//        let output = """
//        override func foo() {
//            super.foo()
//
//            bar()
//        }
//        """
//
//        let formattedInput = (try? format(input, rules: [FormatRules.addBlanklineAfterSuper])) ?? ""
//        XCTAssertEqual(output, formattedInput)
//    }
//
//    func testBlanklineAfterCallSuper_expectNoFormatting() {
//        let input = """
//        override func foo() {
//            super.foo()
//
//        }
//        """
//
//        let output = """
//        override func foo() {
//            super.foo()
//
//        }
//        """
//
//        let formattedInput = (try? format(input, rules: [FormatRules.addBlanklineAfterSuper])) ?? ""
//        XCTAssertEqual(output, formattedInput)
//    }
//
//    func testBlanklineAfterCallSuper_superAtBottom_expectNoFormatting() {
//        let input = """
//        override func foo() {
//            _view = a
//            super.foo()
//        }
//        """
//
//        let output = """
//        override func foo() {
//            _view = a
//            super.foo()
//        }
//        """
//
//        let formattedInput = (try? format(input, rules: [FormatRules.addBlanklineAfterSuper])) ?? ""
//        XCTAssertEqual(output, formattedInput)
//    }
//
//    func testBlanklineAfterCallSuper_multipleLineNoFormatting() {
//        let input = """
//        init() {
//            _view = a
//            super.init(a: 0,
//                       b: 0)
//        }
//        """
//
//        let output = """
//        init() {
//            _view = a
//            super.init(a: 0,
//                       b: 0)
//        }
//        """
//
//        let formattedInput = (try? format(input, rules: [FormatRules.addBlanklineAfterSuper])) ?? ""
//        XCTAssertEqual(output, formattedInput)
//    }
//
//    func testBlanklineAfterCallSuper_parameterWithNewLine() {
//        let input = """
//        init() {
//            _view = a
//            super.init(animated: animated)
//
//            f()
//        }
//        """
//
//        let output = """
//        init() {
//            _view = a
//            super.init(animated: animated)
//
//            f()
//        }
//        """
//
//        let formattedInput = (try? format(input, rules: [FormatRules.addBlanklineAfterSuper])) ?? ""
//        XCTAssertEqual(output, formattedInput)
//    }
}
