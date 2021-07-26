import Foundation

public struct ComicPanels {
    public let panel1: [UInt8]
    public let panel2: [UInt8]
    public let panel3: [UInt8]
    public let panel4: [UInt8]
    
    public init(panel1: [UInt8], panel2: [UInt8], panel3: [UInt8], panel4: [UInt8]) {
        self.panel1 = panel1
        self.panel2 = panel2
        self.panel3 = panel3
        self.panel4 = panel4
    }
}
