{:user
 {:plugins [[lein-pprint "1.1.1"]
            [lein-midje "3.1.3"]
            [lein-try "0.4.1"]
	    [lein-exec "0.3.1"]
	    [cider/cider-nrepl "0.7.0-SNAPSHOT"]]
  :dependencies [[spyscope "0.1.4"]
                 [slamhound "1.5.5"]]
  :aliases {"slamhound" ["run" "-m" "slam.hound"]}
  :injections [(require 'spyscope.core)]}}

