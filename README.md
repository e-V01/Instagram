# Instagram

Logic of Authentication Service:
1) AuthService: init userSession
2) ContentViewModel: receives  user session using Combine
3) ContentView: presents view based on a userSession
4) Either goes into MainTabView or LoginView
