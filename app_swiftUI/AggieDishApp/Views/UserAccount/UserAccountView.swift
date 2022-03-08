import GoogleSignIn
import SwiftUI

struct UserAccountView: View {

  @EnvironmentObject var user: UserAuthModel

  var body: some View {
    if user.isLoggedIn {
      SignOutView().environmentObject(user)
    } else {
      SignInView().environmentObject(user)
    }
  }
}

struct UserAccountView_Previews: PreviewProvider {
  static var previews: some View {
    UserAccountView()
      .previewInterfaceOrientation(.portrait)
  }
}
