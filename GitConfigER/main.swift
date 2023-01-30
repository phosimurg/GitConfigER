//
// Created by Ahmet YILDIZ
//

import Foundation

// Function to execute shell commands
func executeCommand(command: String) {
    let task = Process()
    task.launchPath = "/bin/bash"
    task.arguments = ["-c", command]
    task.launch()
    task.waitUntilExit()
}
print("  ")
print("  ")
print("∆∆ GitConfigER by Phosimurg ∆∆")
print("   ........................   ")
print("  ")


// Ask for gitconfig file path
print("Enter the path of the gitconfig file:")
var gitconfigPath = readLine()!

// Check if file exists
let fileManager = FileManager.default
while !fileManager.fileExists(atPath: gitconfigPath) {
    gitconfigPath = ""
    // If file doesn't exist
    print("File not found. Please enter a valid file path:")
    gitconfigPath = readLine()!
}

// Ask for new username
print("Enter the new username:")
let newUsername = readLine()!

// Ask for new email
print("Enter the new email:")
let newEmail = readLine()!

// Update the gitconfig file
let updateUserNameCommand = "git config --global user.name \"\(newUsername)\""
executeCommand(command: updateUserNameCommand)

// Update the gitconfig file
let updateEmailCommand = "git config --global user.email \"\(newEmail)\""
executeCommand(command: updateEmailCommand)

print("  ")
print("Name and email successfully changed.")
print("  ")
print("∆ gitconfig file looks like this right now. ∆")
print("  ")
print("  ")

// Display the final version of the gitconfig file
let displayGitconfigCommand = "cat \(gitconfigPath)"
executeCommand(command: displayGitconfigCommand)
