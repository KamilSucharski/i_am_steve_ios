import Foundation

public struct ComicPanels {
    public let panel1: URL
    public let panel2: URL
    public let panel3: URL
    public let panel4: URL
    
    public init(panel1: URL, panel2: URL, panel3: URL, panel4: URL) {
        self.panel1 = panel1
        self.panel2 = panel2
        self.panel3 = panel3
        self.panel4 = panel4
    }
}
