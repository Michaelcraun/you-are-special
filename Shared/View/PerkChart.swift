//
//  PerkChartView.swift
//  you-are-special
//
//  Created by Michael Craun on 10/15/21.
//

import SwiftUI

struct PerkChart: View {
    let chart: Version.PerkChart
    @Binding var selectedAttribute: Attribute?
    
    var body: some View {
        
        HStack {
            
            ForEach(chart, id: \.attribute.name) { list in
                
                VStack {
                    
                    AttributeCell(attribute: list.attribute, selected: $selectedAttribute)
                    
                    ForEach(list.perks, id: \.name) { perk in
                        
                        PerkCell(perk: perk)
                        
                    }
                    
                    Spacer()
                    
                }
                
            }
            
        }
        
    }
}

struct PerkChartView_Previews: PreviewProvider {
    static var previews: some View {
        PerkChart(chart: [], selectedAttribute: .constant(nil))
    }
}
