//
//  ViewController.swift
//  21CoreDataBase
//
//  Created by Javier Gomez on 12/10/15.
//  Copyright © 2015 Javier Gomez. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //vamos a usar esta variable de tipo appdelegate para conectar
        //refiere al delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //maneja contenido del appDel que permite acceder al coreData
        let contex: NSManagedObjectContext = appDel.managedObjectContext
  
     
        
        // ========= INGRESAR DATOS ============= //
        /*
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: contex)
        
        newUser.setValue("robino", forKey: "username")
        
        newUser.setValue("@@#Sd", forKey: "password")
        
        do { try
                //almacena permanentemente como el default
                contex.save()
            }   catch   {   print("ERROR AL INGRESAR UN DATO") }
        // ======= END A INGRESAR ======== //
        */
        
        
        //hacemos referencia  a la tabla que estamos utilizando y lo almacenamos en una variable de tipo request
        let request = NSFetchRequest(entityName: "Users")
        //automaticamente esta respuesta regresa valores falsos, entonce se hace otro falso como doble negacion
        request.returnsObjectsAsFaults = false
        
        

        // ========== SEARCH DATOS ============== //
        //format quiere decir el tipo de informacion que solicitamos en este caso le decimos string como en objective c
        //luego preguntamos por el username = Javier
        
        //request.predicate = NSPredicate(format: "username = %@", "jose")
        
        //Nota: Si no se especifica esto, se abrira el valor para TODOS los datos contenidos
        // ======== END a SEARCH ========= //
        
        
        //ejecutar y hacer un recorrido pcon un for por el arreglo que se almaceno en results
        do {
            let results = try contex.executeFetchRequest(request)
            
            //Si encontro algo en la busqueda de uno especificado o si tiene todos los valores
            if  results.count > 0
            {
                //results tendra muchos datos e informacion
                //por eso utilizamos as nsmanagedobjects para separa la informacion que necesitamos
                for result in results as! [NSManagedObject]
                {
                    // ========== DELETE CONTENIDO =========== //
                    //si no se hizo la busqueda de un solo archivo se borrara todos
                    //se tiene que guardar
                    /*contex.deleteObject(result)
                    do {
                        try contex.save()
                    } catch {}
                    //==== END DELETE ==== //
                    */
                    
                    
                    
                    // ************ UPDATE **************** //
                    //si no se hizo la busqueda y se especifico, se acutalizara todos los datos con el nuevo dato
                    /*
                    result.setValue("Petra", forKey: "username")
                    do {
                        try contex.save()
                    } catch {}
                    //==== END UPDATE ==== //
                    */
                    
                    // MOSTRAR LOS USUARIOS O LOS VALORES QUE SE OBTUVIERON
                    if let user = result.valueForKey("username") as? String
                    {
                        print(user)
                    }
                } //end for
            }//end if
            
        }
        catch {     print("No ejecuto la solicitud")   }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

