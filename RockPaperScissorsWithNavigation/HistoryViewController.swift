//
//  HistoryViewController.swift
//  RockPaperScissorsWithNavigation
//
//  Created by xengar on 2017-11-21.
//  Copyright © 2017 xengar. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    
    // History
    var history : [RPSMatch]!
    
    
    // Use this string property as your reuse identifier,
    // Storyboard has been set up for you using this String.
    let cellReuseIdentifier = "MyCellReuseIdentifier"
    
    // MARK: UITableViewDataSource
    
    // Add the two essential table data source methods here
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Implement method to return the correct number of rows.
        return self.history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Implement method to return cell with the correct reuseidentifier and populated with the correct data.
        let cell =  tableView.dequeueReusableCell(withIdentifier: self.cellReuseIdentifier)!
        let historyItem = self.history[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text = victoryStatusDescription(historyItem)
        cell.detailTextLabel?.text = detailsMatch(historyItem)
        cell.imageView?.image = imageForMatch(historyItem)
        
        return cell
    }
    
    // Creates a status
    func victoryStatusDescription(_ match: RPSMatch) -> String {
        if (match.p1 == match.p2) {
            return "Tie."
        } else if (match.p1.defeats(match.p2)) {
            return "Win!"
        } else {
            return "Loss."
        }
    }
    
    func detailsMatch(_ match: RPSMatch) -> String {
        return "User: " + match.p1.description + " vs Computer: " + match.p2.description
    }
    
    // MARK: Image for Match
    func imageForMatch(_ match: RPSMatch) -> UIImage {
        
        var name = ""
        
        switch (match.winner) {
        case .rock:
            name = "RockCrushesScissors"
        case .paper:
            name = "PaperCoversRock"
        case .scissors:
            name = "ScissorsCutPaper"
        }
        
        if match.p1 == match.p2 {
            name = "itsATie"
        }
        return UIImage(named: name)!
    }
    
    @IBAction func closeWindow(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
}

