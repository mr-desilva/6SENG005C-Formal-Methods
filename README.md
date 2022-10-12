# How To Create a Workspace Per-Tutorial With Minimal Errors!

First you should have a main folder with module name or something.
Eg : - Formal Methods >> Tutorial 1
Maintain a folder for each tutorial with number.
```markdown
├── Formal Methods
│ ├── Tutorial 1
│ ├── Tutorial 2
│ ├── ....
```

# Steps

`1. Create a new workspace >> set the workspace name as Tutorial 1`

`2. Change the workspace database directory from default to your main Tutorial number folder. 
Eg: - C:/...../Formal Methods/Tutorial 1`


<img src = "https://github.com/mr-desilva/6SENG005C-Formal-Methods/blob/main/Images/step%202%20image.png">


`3. Click Finish`

`4. Right Click on the Tutorial1 workspace and create a new project`

`5. Give a project name >> Eg: - my_lab1`

<img src = "https://github.com/mr-desilva/6SENG005C-Formal-Methods/blob/main/Images/step%205%20image.png">

`6. Check the project Database path >> C:/..../Formal Methods/Tutorial 1/my_lab1/bdp`

`7. Check the Translation Directory path >> C:/..../Formal Methods/Tutorial 1/my_lab1/lang`

> Note - The tutorial number in the path should be changed to the respective tutorial number.
> 

> Eg: -- For the Tutorial 2 it should be as follow
>> Project Database path >> C:/..../Formal Methods/Tutorial 2/my_lab1/bdp
>> Translation Directory path >> C:/..../Formal Methods/Tutorial 2/my_lab1/lang

It took a little time to understand how the folder structure with the atelierB, hope this will help anyone in the future for reference **😄**

# Common Issues with AtelierB

These are some of the common issues and workarounds found when using atelierB



##  1. Missing projects under the workspaces 

Right click on a workspace and select **open**.

## 2. Unable to create a component for the project

After reopening the application if you can't create a new component (appears to be disabled), **double click on the project** and now you can create components.

## 3. Deleting a workspace
To delete a workspace first you have to open a exsisting workspace, double click on a project. After that you can select any workspace and right click --> remove

> Note - AtelierB will unexpectedly exit if not.

After removing the workspace from the atelierB, you have to manually clear the rest of the folders from the file explorer.



# Additional 

`Default workspace directory path ` 
> C:\Users\username\AtelierB_Data\AtelierB_free_4.7.1\press\bdb

***This is where all the .desc files will save for a each new project.***

`If you create a project named my_lab1 under the Tutorial 1 workspace, there will be a generated .desc file
as my_lab1.desc under the Tutorial 1 workspace directory path`
