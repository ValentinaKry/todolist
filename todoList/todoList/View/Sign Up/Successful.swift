
import SwiftUI

struct Successful: View {
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image("undrawConfirmed")
                .frame(width: 162, height: 170)

            HStack {
                VStack(alignment: .center, spacing: 12) {
                    Text("Succesful")
                        .font(.custom("Roboto-ThinItalic", size: 32))
                        .foregroundColor(Color("black"))
                    Text("You have succesfully change passord. Please use your new passwords when logging in.")
                        .multilineTextAlignment(.center)
                        .font(.custom("Roboto-Medium", size: 16))
                        .foregroundColor(Color("black"))
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 8)
                }
                .padding()
            }
            .padding(.bottom, 15)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)

        // Хранить в массиве вьюшки и через секунду возвращаться
        // В проект UINavigation Kit . юай хостинг контролеер.
        // asing after 1 секонд
            
    }
}

struct Successful_Previews: PreviewProvider {
    static var previews: some View {
        Successful()
    }
}
