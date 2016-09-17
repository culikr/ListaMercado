//
//  MercadosTableViewController.swift
//  Lista de Mercados
//
//  Created by iossenac on 17/09/16.
//  Copyright © 2016 culik. All rights reserved.
//

import UIKit

class MercadosTableViewController: UITableViewController {
    
    // MARK: Model
    let mercados = [
       
        (segmento:"mercado",nome:"Zafari",numlojas:1),
        (segmento:"loja",nome:"Nacional",numlojas:1),
        (segmento:"loja",nome:"Rissul",numlojas:1),
        (segmento:"mercado",nome:"BIG",numlojas:1),
        ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

  

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mercados.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
         let (segmento,nome,numloja) = mercados[indexPath.row]
        // Configure the cell...
        //cell.textLabel?.text = mercados[indexPath.row].nome
        if let celula = cell as? MercadoTableViewCell {
            
            celula.configure(segmento,nome,numloja)
            
        }

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier=="mostraDetalhe"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let (segmento,nome,numloja) = mercados[indexPath.row]
                if let navcon = segue.destinationViewController as? UINavigationController {
                if let destino = navcon.visibleViewController as? MercadoDetailViewController {
                    destino.numloja = numloja
                    destino.segmento = segmento
                    destino.nome = nome
                    }
                }
                
            }
        }
        
    }
    

}
