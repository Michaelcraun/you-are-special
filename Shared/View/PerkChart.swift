//
//  PerkChartView.swift
//  you-are-special
//
//  Created by Michael Craun on 10/15/21.
//

import SwiftUI

struct PerkChart: View {
    let chart: [AttributeViewModel]
    @Binding var selectedAttribute: Attribute?
    
    var body: some View {
        
        HStack {
            
            ForEach(chart, id: \.attribute.name) { model in
                
                VStack {
                    
                    AttributeCell(attribute: model.attribute, selected: $selectedAttribute)
                    
                    ForEach(model.perks, id: \.perk.name) { model in
                        
                        PerkCell(perk: model.perk)
                        
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
