import SwiftUI

struct SignOutView: View {
  @EnvironmentObject var user: UserAuthModel

  fileprivate func SignOutButton() -> some View {
    Button(action: {
      user.signOut()
    }) {
      Text("Sign Out")
    }
    .padding(10)
    .background(Color.white)
    .foregroundColor(Color.black)
    .font(.body.weight(.bold))
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .stroke(Color.gray, lineWidth: 2)
    )
  }

  var body: some View {
    NavigationView {
      VStack {
        HStack {
          Image("default_profile")
            .resizable()
            .clipShape(Circle())
            .frame(width: 100, height: 100)
            .overlay(Circle().stroke(Color.yellow, lineWidth: 5))
          VStack {
            Text(user.givenName)
              .font(.title.weight(.bold))
            SignOutButton()
          }
          .padding([.leading])

        }
        .padding()

        UserSelectionsView()
      }
    }
  }

}
