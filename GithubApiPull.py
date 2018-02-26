'''
Here I have used requests library to make a call to github's api , however we can also use curl and get the response from the api.

In the question 6 , it asks for members of repo , however I could not find documention of github api for members of repo. Members usually belong to
oraganisation not repo. Repo has contributer and collaborators.

I was getting error while find collaborators since I dont have push access to the given repo. However the code will be similiar. This below code is
implementation to find number of contributers.


'''

import requests
import json
def list_members(username,password,repo_url) :
     api_base_url = 'https://api.github.com'
     repo_attributes = repo_url.split('/')
     owner = repo_attributes[3]
     repository = repo_attributes[4]
     if owner == '' or repository == '':
          print('enter valid repository url')
          return
     #r = requests.get('{2}/repos/{0}/{1}/collaborators'.format(owner,repository,api_base_url), auth=(username, password))
     r = requests.get('{0}/repos/{1}/{2}/contributors'.format(api_base_url,owner,repository),auth=(username, password))

     if r.status_code == 200:
         data =  json.loads(r.content.decode('utf-8'))
         print(data)
         member_list = []
         for i in data :
             if i['login'] :
                 member_list.append(i['login'])
         return member_list
     else:
         print(r.status_code)
         return None

# parameter for api authentication
api_username = 'xxx'
api_password = 'xxx'
repository_url = 'https://github.com/vinay-shipt/de-take-home'
members = list_members(api_username,api_password,repository_url)
if members :
    print(members)
else :
    print('No members for the specified repository')
