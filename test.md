Flow : 
Landing page :  list the sales card(sale date,name , village then  total sales amount )
Sales details page:  crop name and amount table , sales edit and delete icon
Add page : 



I am building a large-scale Flutter application using GetX, HTTP, and GetStorage.
I already have an HttpService class for making API calls. I want to create a new module in a clean and scalable way.
Requirements:
Use GetX structure: controllers, models, repository, views (UI), bindings, and routes
No custom themes. Use Get.theme.
Avoid memory leaks, widget re-renders.
Use flutter isolates for smooth UI & instant feedback.
Follow clean architecture.
I will now give you:
API endpoints
JSON responses
Desired UI/UX flow


I have a Flutter app using GetX + GetStorage + HttpService (custom class I’ll reuse).
I want to create a new module: Task Module
UI/UX Flow:
Filters Section:
Land dropdown
Date filter (Today, This Week, This Month)


Task List View:
My Task list with date subtitle sections
Task card UI with:
Crop name
Activity type
Edit and Delete icons


(Fast list updates using local-first)


Add Task:


FAB (folding action)


Bottom sheet form:


Required: crop type, activity type, schedule date (default today), description
Recurring checkbox:
If checked, show tab: Daily, Weekly, Monthly
Daily: schedule end date
Weekly: weekday dropdown, end date
Monthly: end date


Schedule end date starts from selected start date
If schedule type changes, clear end date
Submit button → local update first, then sync to API
 API Details:
1. Get Task List
Endpoint:
 GET /get_task_list/<farmer_id>?land_id=<land_id>&month=<month>
2.  Add Task
Endpoint:
 POST /new_task/
Body:

3.  Edit Task
Endpoint:
 POST /edit_task/<task_id>
Body:


4.  Delete Task
Endpoint:
 POST /deactivate-my-schedule/<task_id>/
Body


 Reuse Existing HTTP Service
Mention this in the prompt:
 I’ve already created a HttpService with standard get, post, put, multipart, and error handling. Please reuse it for API calls instead of writing new ones.

Expected Output (for any module):
Please generate full module code including:
Controller 
Model (matching JSON response)
Repository (using HttpService)
View (screens /widgets)
Bindings
Routes

Let me know if you want me to now generate the entire Task module with this structure for your project. I can provide files step-by-step: Model, Repository, Controller, UI, and so on.
