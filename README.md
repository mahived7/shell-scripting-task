# Shell Scripting Basics - DevOps Automation Task

## 📋 Task Overview

This project demonstrates fundamental shell scripting concepts for DevOps automation, including:
- System information gathering
- Log file management
- Automated backup operations
- Cleanup tasks

## 🎯 Learning Objectives

1. Create shell scripts with proper shebang lines
2. Print system information using bash commands
3. Implement variables, conditionals, and loops
4. Automate log cleanup and backup tasks
5. Make scripts executable and run them
6. Redirect output to files
7. Add comprehensive comments and documentation

## 📁 Project Structure
```
shell-scripting-task/
├── scripts/
│   └── devops_automation.sh    # Main automation script
├── screenshots/
│   ├── 01_script_content.png
│   ├── 02_make_executable.png
│   ├── 03_script_execution.png
│   ├── 04_execution_log.png
│   ├── 05_backup_files.png
│   └── 06_backup_contents.png
├── outputs/                     # Sample output files
├── logs/                        # Execution logs
└── README.md
```

## 🚀 Getting Started

### Prerequisites

- Linux/Unix environment (Ubuntu, macOS, etc.)
- Bash shell (version 4.0 or higher)
- Basic command-line knowledge

### Installation & Usage

1. **Clone the repository:**
```bash
git clone https://github.com/YOUR_USERNAME/shell-scripting-task.git
cd shell-scripting-task
```

2. **Make the script executable:**
```bash
chmod +x scripts/devops_automation.sh
```

3. **Run the script:**
```bash
./scripts/devops_automation.sh
```

## 📸 Screenshots

### 1. Script Content
![Script Content](screenshots/01_script_content.png)

### 2. Making Script Executable
![Make Executable](screenshots/02_make_executable.png)

### 3. Script Execution
![Script Execution](screenshots/03_script_execution.png)

### 4. Execution Log Output
![Execution Log](screenshots/04_execution_log.png)

### 5. Created Backup Files
![Backup Files](screenshots/05_backup_files.png)

### 6. Backup Contents
![Backup Contents](screenshots/06_backup_contents.png)

## 🛠️ Script Features

### Variables
```bash
BACKUP_DIR="$HOME/log_backups"
LOG_DIR="$HOME/test_logs"
DAYS_OLD=7
```

### Conditionals
```bash
if [ -f $BACKUP_FILE ]; then
    echo "Backup created successfully"
else
    echo "Backup failed!"
fi
```

### Loops
```bash
for file in $LOG_DIR/*.log; do
    echo "Processing: $file"
done
```

### Functions
- `create_directories()` - Creates required directories
- `backup_logs()` - Creates compressed backup archives
- `cleanup_old_backups()` - Removes old backup files
- `display_summary()` - Shows execution statistics

## 📊 Key Functionalities

1. **System Information Display**
   - Hostname, OS, Kernel version
   - Current user and timestamp

2. **Log Management**
   - Automatic log file discovery
   - Compressed backup creation (tar.gz)
   - Retention policy implementation

3. **Output Redirection**
   - All output saved to timestamped log files
   - Simultaneous console and file output

4. **Error Handling**
   - Exit codes for success/failure
   - Informative error messages

## 🎓 Concepts Demonstrated

- ✅ Shebang line (`#!/bin/bash`)
- ✅ Variables and command substitution
- ✅ Conditional statements (if/else)
- ✅ Loops (for loops)
- ✅ Functions
- ✅ File operations
- ✅ Output redirection (`>`, `>>`, `|`, `tee`)
- ✅ Command chaining
- ✅ Error handling
- ✅ Comments and documentation

## 📝 Sample Output
```
=========================================
DevOps Automation Script Started
Execution Time: Mon Feb 09 11:30:45 IST 2026
=========================================

[INFO] Starting automation tasks...

[INFO] Creating necessary directories...
[SUCCESS] Directories created/verified

[INFO] Creating test log files...
[SUCCESS] Test logs created

=========================================
LOG FILES FOUND
=========================================
-rw-r--r-- 1 user user 45 Feb  9 11:30 /home/user/test_logs/access.log
-rw-r--r-- 1 user user 42 Feb  9 11:30 /home/user/test_logs/app.log
-rw-r--r-- 1 user user 44 Feb  9 11:30 /home/user/test_logs/error.log

=========================================
CREATING BACKUP
=========================================
[SUCCESS] Backup created: /home/user/log_backups/logs_backup_20260209_113045.tar.gz
[INFO] Backup size: 4.0K

=========================================
EXECUTION SUMMARY
=========================================
[SUCCESS] All automation tasks completed successfully!
```

## 🔧 Customization

You can customize the script by modifying these variables:
```bash
BACKUP_DIR="$HOME/log_backups"    # Change backup location
LOG_DIR="$HOME/test_logs"          # Change log source directory
DAYS_OLD=7                         # Change retention period
```

## 📚 Learning Resources

- [Bash Scripting Tutorial](https://www.shellscript.sh/)
- [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/)
- [Linux Command Line Basics](https://ubuntu.com/tutorials/command-line-for-beginners)

## 🤝 Contributing

Feel free to fork this repository and submit pull requests for improvements!

## 📄 License

This project is open source and available under the MIT License.

## 👤 Author

**Your Name**
- GitHub: [@YOUR_USERNAME](https://github.com/YOUR_USERNAME)
- Date: February 9, 2026

## 🙏 Acknowledgments

- Task reference: Shell Scripting Basics - DevOps Training
- Tools: Bash, Git, GitHub

---

**Note:** This is a learning project demonstrating shell scripting fundamentals for DevOps automation tasks.
