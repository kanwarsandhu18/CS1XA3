# CS-1XA3 | PROJECT-01           |  <sandhk8>
**The repository CS1XA3 has a running bash script which is in the file CS1XA3/Project01/project_analyze.sh** 
             
There is a fun prompt just to make the user engaged by testing the typing speed of the user. This inspiration was taken from [Link](http://linuxcommand.org/lc3_wss0100.php)

**NOTE - IFS is set to `$'\n'`** 


## Usage
- Make the project_analyze.sh executable with :    
  `chmod +x CS1XA3/Project01/project_analyze.sh`     
- To run the script , use command :                 
`./CS1XA3/Project01/project_analyze`               
- There are no such arguments , User input is taken as feature 6.1

## FEATURE 6.1
>Description: This is the script input feature which requests user to enter a feature code corresponding to the desired feature. To run enter code

### -EXECUTION      
- **FEATURE 6.2 --> 2**
- **FEATURE 6.5 --> 5**
- **FEATURE 6.6 --> 6**

## FEATURE 6.2
>Description: The FIXME Log feature, searches through the repo and the file fixme.log is overwritten (created if not present) with the names of the files that contain the keyword **#FIXME** in the last line of the file.
The `find ` command finds the desired files , `tail -1` and `grep` is used to filter the files that match the conditions and only those **filenames** are written whose **exit status** `$?` for `grep` is 0 .
### -EXECUTION
- Enter feature code -> **2** and press enter.
-  The lines containing #FIXME at the end of the file will be displayed.
- ALL the files corresponding to these files will be written in `CS1XA3/Project01/fixme.log`
- Within directory `CS1XA3/Project01`, use `ls` and check the contents of fixme.log using `cat`
## FEATURE 6.5
>Description: The FILE TYPE feature counts the number of files with extension input by the user , in the entire repository. The `read` command takes the file extension as input and `find $file_path/ -name "*.$ext"` finds only those file in repo that has the given extension.
The `for` loop counts the number of such files.
### -EXECUTION
- Enter the feature code -> **5** and press enter
- Enter the extension (py, jpeg,txt,log) and press enter.
 - The number of files with the desired extension in the repo is given as output
- If no file is found, it returns 0.
## FEATURE 6.6
>Description: The find Tag command creates a file `CS1XA3/Project01/"$Tag".log` '(overwrites it if it already exists) and writes the name of the files with the extension ".py"  which has the keyword `$tag` and begins with a `#` into `CS1XA3/Project01/"$Tag".log`
The command `find $file_path/ -name "*.py"` finds all files with extension with "py" . `for` loop is applied to each output of find and command `grep -E '^#' $item  | grep $Tag` is passed to each item of loop which matches line containing "#" and "$Tag" . The lines having exit status `$?` 0 are written in `CS1XA3/Project01/"$Tag".log`
### -EXECUTION
- Run the feature by entering feature code -> **6** and pressing Enter.
- Input the desired tag you want to search for and press enter.
- use the ls command to check if file `CS1XA3/Project01/"$Tag".log`
- use `cat CS1XA3/Project01/"$Tag".log` and all the desired comments with tag will be in the output .
## CUSTOM FEATURE 1
### -Encrypt numeric key
>Objective -This feature will search for a particular file extension and in that  search for the **"key combination"** which contains (a lower case alphabet)(numeric digit)(a higher case aplhabet) in succession. All these combinations from various files will be saved in a file with .safe extension and the **"numeric digit"** digit will be replaced by **"#"**
## CUSTOM FEATURE 2
### -seperate keys and values
This feature takes 1 input for filename(without extension) and makes 2
files , the script will include  an array with the value associated with each key and it will print out values in one file and the corresponding keys into the other.
