//
//  ListCell.swift
//  TesteSwiftUI
//
//  Created by Alessandro Emanuel Ferreira De Souza on 24/01/24.
//

import SwiftUI

struct ListCell: View { //@Composable
    
    @State private var tapped: Bool = false //state => remember {}
    @State private var rotate: Double = 180.0
    var row: Int
    var question: String
    var answer: String
    
    let imageWhite = UIImage(named: "chevron")?.colored(.white)
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text(question)
                    .padding()//lateral 0
                    .frame(
                        maxWidth: .infinity, //infinity => match_parent
                        alignment: .leading //leading => orientation view align start
                    )
                    .foregroundColor(.white)
                
                Image(uiImage: imageWhite ?? UIImage())//.colorMultiply(.white)
                    .padding()
                    .rotationEffect(
                        .degrees(
                            tapped ? rotate : 0.0
                        )
                    )
                    .clipped()
                
            }
            .background(//pertence ao HStack
                Color(#colorLiteral(
                    red: 0.74, green: 0.13, blue: 0.30, alpha: 1
                ))
            )
            .onTapGesture(perform: {// onClickEvent - pertence ao HStack
                withAnimation(.easeInOut(duration: 0.5)) {
                    tapped.toggle() //toggle => tapped != tapped
                }
            })
            
            if (tapped) {
                Text(answer)
                    .padding()
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .background(
                        Color(#colorLiteral(
                            red: 0.62, green: 0.10, blue: 0.25, alpha: 1
                        ))
                    )
                    .clipped()
                    .background(Color.clear)//Color.clear = Color.Transparent
                    .foregroundColor(.white)
            }
        }
    }
}

extension UIImage {
    func colored(_ color: UIColor) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            color.setFill()
            draw(at: .zero)
            context.fill(
                CGRect(x: 0, y: 0, width: size.width, height: size.height), blendMode: .sourceAtop
            )
        }
    }
}

#Preview {
    ListCell(
        row: 0, 
        question: "loren ipsun",
        answer: "loren ipsun, loren ipsun, loren ipsun, loren ipsun"
    )
}
