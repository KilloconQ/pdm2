//
//  SwiftUIView.swift
//  CLUB_ROCK_ROLL
//
//  Created by Fernando Corrales on 18/05/22.
//

import SwiftUI

struct EventosView: View {
    let eventImageMark: String  = "https://cdn.shopify.com/s/files/1/0377/1868/7876/products/CalendarioFebrero2022Boho_PostenInstagram_2160x1080px_1000x1400px_PostenInstagram_1080x.png?v=1651627755"
  let eventImageMark2: String  = "https://cdn.shopify.com/s/files/1/0377/1868/7876/products/CalendarioFebrero2022Boho_PostenInstagram_2160x1080px_1000x1400px_PostenInstagram_2_1080x.png?v=1651709099"

  let eventImageMark3: String  = "https://scontent-qro1-1.xx.fbcdn.net/v/t39.30808-6/282120348_3056750504586436_8867812859769455671_n.jpg?_nc_cat=102&ccb=1-6&_nc_sid=a26aad&_nc_ohc=K-8JQJUziKUAX-vWEsd&_nc_ht=scontent-qro1-1.xx&oh=00_AT_wQnB45XoEL6B5QCDfnq_nxVWcdTvqwD3cm89nH-DLIQ&oe=628A85B4"

  let eventImageMark4: String  = "https://scontent-qro1-1.xx.fbcdn.net/v/t39.30808-6/281775083_3056750497919770_8608386623283727434_n.jpg?_nc_cat=110&ccb=1-6&_nc_sid=a26aad&_nc_ohc=tlqJRqjXZP4AX-UnRss&_nc_ht=scontent-qro1-1.xx&oh=00_AT-D-_aXr0JeDM3J33Xu6l0rF6BDaJiddp-XqhwhavcPQw&oe=628B305A"


    var body: some View {
      ScrollView{
      VStack{
            AsyncImage(url: URL(string: eventImageMark)) {
                image in image
                    .resizable()
                    .scaledToFit()
            }placeholder: {
                ProgressView()
            }
            .cornerRadius(5)
          AsyncImage(url: URL(string: eventImageMark2)) {
              image in image
                  .resizable()
                  .scaledToFit()
          }placeholder: {
              ProgressView()
          }
          .cornerRadius(5)
        AsyncImage(url: URL(string: eventImageMark3)) {
            image in image
                .resizable()
                .scaledToFit()
        }placeholder: {
            ProgressView()
        }
        .cornerRadius(5)
        AsyncImage(url: URL(string: eventImageMark4)) {
            image in image
                .resizable()
                .scaledToFit()
        }placeholder: {
            ProgressView()
        }
        .cornerRadius(5)

        }
      .background(Color.black)
        .navigationTitle("Eventos")
      Spacer()
    }
    }
}

struct EventosView_Previews: PreviewProvider {
    static var previews: some View {
        EventosView()
    }
}
