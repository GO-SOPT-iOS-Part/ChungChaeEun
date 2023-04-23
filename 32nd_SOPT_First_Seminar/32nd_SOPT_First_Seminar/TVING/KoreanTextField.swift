//
//  KoreanTextField.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/04/18.
//
import UIKit.UITextField

class KoreanTextField: UITextField {

    private func getKeyboardLanguage() -> String? {
        return "ko-KR"
    }

    override var textInputMode: UITextInputMode? {
        if let language = getKeyboardLanguage() {
            for inputMode in UITextInputMode.activeInputModes {
                if inputMode.primaryLanguage! == language {
                    return inputMode
                }
            }
        }
        return super.textInputMode
    }

}
