Configuration SimpleConfig {
    
    Node "webserver" {
         
        WindowsFeature IIS {
            Ensure="Present"
            Name= "Web-Server"
        }

    }

    Node "ICauseFailures" {
        
        WindowsFeature Yikes {
            Ensure="Present"
            Name= "Weeeeeeeb-Server"
        }
    }
}