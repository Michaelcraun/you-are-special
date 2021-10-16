//
//  PerkChartView.swift
//  you-are-special
//
//  Created by Michael Craun on 10/15/21.
//

import SwiftUI

struct PerkChartView: View {
    let chart: [Version.AttributeList]
    
    var body: some View {
        
        HStack {
            
            ForEach(chart, id: \.attribute.name) { list in
                
                VStack {
                    
                    AttributeView(attribute: list.attribute)
                    
                    ForEach(list.perks, id: \.name) { perk in
                        
                        PerkView(perk: perk)
                        
                    }
                    
                    Spacer()
                    
                }
                
            }
            
        }
        
    }
}

struct PerkChartView_Previews: PreviewProvider {
    static var previews: some View {
        PerkChartView(chart: [])
    }
}
