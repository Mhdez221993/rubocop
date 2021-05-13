# Ruby Linter for Microverse capstone project

This project was built in ruby to check ruby code, it is a linters for beginners, it provides feedback about errors or warning in code little by little.
It was developed following the best practices

In this project we are looking for the following errors:

   - Wrong indentation
   - Trailing spaces   
   - New line errors
   - Empty files
   - Last empty line
## Built With
- Ruby

## Getting Started
### Prerequisites
   - Installed Ruby

To get a local copy up and running follow these simple example steps.

Go to  git clone git@github.com:Mhdez221993/my_lin.git


### Install RSpec

To run the tests locally :

- To instal RSpec for testing please run the following command on your terminal:

   ` gem install rspec`

### Run tests

To test the code, run  `rspec`  from the root of the folder using the terminal.

## Instructions

1) Open your terminal:
    - On Windows => <code>Win + R</code>
    - On Linux => <code>ctrl + alt + T</code>
    - On Mac => <code>Control + Option + Shift + T</code>

2) Go to the directory where my_lin project is located, it will be the one where you cloned the repository. Execute the main.rb by typing:
    - <code>bin/main.rb</code>

3) you can provide a path to test a specific file or just run the previous command to test your actual directory.


##  Good and bad code examples

### Wrong indentation
~~~ruby
//Good Code

def call_check_last_line
  check_last_line unless File.zero?(file)
end

//Bad Code

def call_check_last_line
check_last_line unless File.zero?(file)
end
~~~

### Trailing spaces
~~~ruby
//Good Code

def call_check_last_line
  check_last_line unless File.zero?(file)
end

//Bad Code

def call_check_last_line
  check_last_line unless File.zero?(file)  
end
~~~

### New line errors
~~~ruby
//Good Code

def call_check_last_line
  check_last_line unless File.zero?(file)
end

def call_check_last_line
  check_last_line unless File.zero?(file)
end

//Bad Code

def call_check_last_line
  check_last_line unless File.zero?(file)  
end
def call_check_last_line
  check_last_line unless File.zero?(file)
end
~~~


### Last empty line
~~~ruby
//Good Code

def call_check_last_line
  check_last_line unless File.zero?(file)
end

def call_check_last_line
  check_last_line unless File.zero?(file)
end


//Bad Code

def call_check_last_line
  check_last_line unless File.zero?(file)  
end

def call_check_last_line
  check_last_line unless File.zero?(file)
end
~~~


## Authors
👤 **Moises Hernandez Coronado** 

- GitHub: [@Mhdez221993](https://github.com/Mhdez221993) 
- Twitter: [@MoisesH42060050](https://twitter.com/MoisesH42060050) 
- LinkedIn: [Moises Hernandez Coronado](https://www.linkedin.com/in/moises-hernandez-9bbb17145/) 

## Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Mhdez221993/my_lin/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- To my coding partner who helped me through all the work
- To my Stand Up Team who kept my morale up!
