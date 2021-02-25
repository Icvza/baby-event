Event Logger app for New Parents to log milestones/eventful moments with thier newborn 


The app will have:

Main attributes:
    -Users: have many events, have many babies
    -event : Belongs to Users:
    -Babies: belongs to Users  

UX-flow:

    -Homescreen will have the ablilty to allow a user to sighn up to become a member of the app
        -Try to make the homescreen look nice with some CSS the home screen can not show any information about post - This is a user only app so only the user it self can see the content create
        -Learn more about Layout to see what kind of code I can save from writing 
    
    - Sign up page: 
        - Will show a form
            --Form : Will allow the user to create a profile with User name email and Baby name and age 
                
    - post/form: Will direct the user to a page where they will be able to create a new event 

    - Client will able to edit new event 

    - Right after post/form All pages should have a logout feature

DB's-structure:

    Users Table:
        - Name 
        - Age 
 
    Babies Table:
        - Name
        - Age
        - Foreign_id key for users
    
    Events Table:
        - Date time
        - Content 
        - Foreign_id key for users
        - Foreign_id key for babies


    


    

    