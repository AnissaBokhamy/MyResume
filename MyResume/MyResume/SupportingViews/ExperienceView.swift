//
//  ExperienceView.swift
//  MyResume
//
//  Created by Anissa Bokhamy on 11/09/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import SwiftUI

struct ExperienceView: View {
    
    var experience: Experience?
    
    @State var logoName : String
    
    init(experience: Experience?){
        self.experience = experience
        switch experience?.type {
        case .Studies:
            _logoName = .init(initialValue: "SchoolLogo")
        case .DevelopperJob:
            _logoName = .init(initialValue: "CodingLogo")
        default:
            _logoName = .init(initialValue: "SchoolLogo")
        }
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Path { path in
                    path.move(to: CGPoint(x: geometry.size.width / 2, y: 0))
                    path.addLine(to: CGPoint(x: geometry.size.width / 2, y: 70))
                }
                .stroke(style: StrokeStyle( lineWidth: 1, dash: [4]))
                .foregroundColor(Color("Dark Grey"))
                .frame(maxHeight: 70, alignment: .top)
            }
            .frame(maxHeight: 70, alignment: .top)
            Image(self.logoName)
            Text("Maîtrise en Informatique")
                .font(.title)
                .foregroundColor(Color("Dark Grey"))
                .bold()
            Text("août 2018 - fév. 2020")
                .font(.subheadline)
                .foregroundColor(Color("Dark Grey"))
            Divider()
                .padding(.horizontal, 50)
            DetailedExperienceView()
            Spacer()
        }
    }
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        let experience = Experience()
        experience.type = .Studies
        return ZStack {
            Color("Light Grey")
            ExperienceView(experience: experience)
        }
    }
}

struct DetailedExperienceView: View {
    
    //@Binding var experience: Experience
    
    var body: some View {
        VStack {
            Text("« Cette expérience à l’étranger a été pour moi l’occasion de me confronter à la diversité culturelle. Académiquement, j’ai pu découvrir une nouvelle façon de »")
                .font(.subheadline)
                .bold()
                .padding(.horizontal,50)
            HStack (alignment: .top) {
                KeyFact()
                KeyFact()
                KeyFact()
            }
                .frame(height: 85)
            Text("• Approfondissement de sujets choisis parmis une banque de cours")
                .font(.subheadline)
                .padding(.horizontal,50)
            Text("• Approfondissement de sujets choisis parmis une banque de cours")
                .font(.subheadline)
                .padding(.horizontal,50)
        }
    }
}

struct KeyFact: View {
    
    let circleWidth : CGFloat = 85.0
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: circleWidth)
                .foregroundColor(Color("Middle Grey"))
            Text("🏫\n Université du Québec à Chicoutimi")
                .font(.system(size: 11))
                .fontWeight(.light)
                .frame(maxWidth: circleWidth, maxHeight: circleWidth)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("Dark Grey"))
        }
    }
}
