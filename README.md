# Instagram

Logic of Authentication Service:
1) AuthService: init userSession
2) ContentViewModel: receives  user session using Combine
3) ContentView: presents view based on a userSession
4) Either goes into MainTabView or LoginView

Logic of userRegistration:
1) AuthService: createUser(), uses Shared instance
2) RegistrationViewModel leads to  
a) EmalView
b) UsernameView
c) PasswordView
d) CompleteSignUp

RegistrationVM contains all the properties needed to sign up that get set throughout the registration flow.

Also responsible for callong "createUser()" func in AuthService

The auth service here is the same shared instance that the ContentView is using. When the userSession gets set from the registration flow, it will also update the ContentView.

Recommend to read: https://www.avanderlee.com/swiftui/downloading-caching-images/
Imported Kingfisher

