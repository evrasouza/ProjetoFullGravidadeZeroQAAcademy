robot -l NONE -o NONE -r NONE tasks/Delorean.robot
#robot -d ./logs -i rr_fields tests/Signup.robot
#robot -d ./logs -i attempt_login tests/Login.robot
#robot -d ./logs tests/BeGeek.robot
#robot -d ./logs tests/AttemptBeGeek.robot
#robot -d ./logs -i smoke tests
#robot -d ./logs  tests
#robot -d ./logs -v BROWSER:chromium -v HEADLESS:True -i smoke tests
pabot -d ./logs -v BROWSER:chromium -v HEADLESS:True tests

rm -rf ./logs/browser
mkdir ./logs/browser
mkdir ./logs/browser/screenshot

cp $(find ./logs/pabot_results -type f -name "*.png") ./logs/browser/screenshot