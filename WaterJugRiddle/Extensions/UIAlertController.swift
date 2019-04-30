import UIKit

extension UIAlertController {

    /// Creates and returns a view controller for displaying an alert with text field to the user.
    ///
    /// - Parameters:
    ///   - title: The title of the alert. It will be localized.
    ///            Use this string to get the user’s attention and communicate the reason for the alert.
    ///   - message: Descriptive text that provides additional details about the reason for the alert.
    ///              It will be localized.
    ///   - text: The text displayed by the text field.
    ///   - text: The placeholder displayed by the text field.
    ///   - saveTitle: The text to use for the save button title. It will be localized.
    ///   - handler: A block to execute when the user selects the save action.
    ///              This block has no return value and takes the save action object and new text as its parameters.
    convenience init(editor title: String?,
                     message: String?,
                     text: String?,
                     placeholder: String?,
                     saveTitle: String,
                     saveHandler: @escaping ((UIAlertAction, String) -> Void),
                     cancelHandler: @escaping ((UIAlertAction) -> Void)) {
        self.init(title: title,
                  message: message,
                  preferredStyle: .alert)

        //Add text field
        var textField: UITextField!
        addTextField { textField = $0 }
        textField.text = text
        textField.placeholder = placeholder

        //Add cancel action
        addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: cancelHandler))

        //Add save action
        let saveAction = UIAlertAction(title: saveTitle, style: .default) { action in
            if let newText = textField.text {
                saveHandler(action, newText.trimmed())
            }
        }
        addAction(saveAction)
        preferredAction = saveAction
    }

}
