//
//  TaskMainView.swift
//  TaskApp
//
//  Created by 田中正造 on 05/06/2025.
//

import SwiftUI

enum TimeOfDay:String,Hashable,CaseIterable,Identifiable {
    case morning = "朝"
    case afternoon = "昼"
    case evening = "夕"
    case night = "夜"
    
    var id: Self { self }
    
    var timeSlot: String {
        self.rawValue
    }
}

struct TaskMainView: View {
    @State var taskText: [TimeOfDay:String ] = Dictionary(
        uniqueKeysWithValues: TimeOfDay.allCases.map{
            ($0,"")
        }
)
        
    var body: some View {
        VStack{
            
            Text("タスクを４つに分けよう！")
                .padding()
            
            
            List{
                
                ForEach(TimeOfDay.allCases){ TimeCase in
                    Section(header: Text(TimeCase.timeSlot)) {
                        HStack{
                            
                            TextField("ここに\(TimeCase.timeSlot)のタスクを入れよう",text: binding(for:TimeCase))
                                .modifier(TaskModifier())
                            
                        }
                    }
                }
                
            }
            
            
            
            
            .padding()
        }
    }
    private func binding(for timeOfDay: TimeOfDay) -> Binding<String> {
        return Binding(
            get: self.taskText[timeOfDay,default:""],
            set: {newValue in self.taskText[timeOfDay] = newValue
            }
        )
    }
}

#Preview {
    TaskMainView()
}
