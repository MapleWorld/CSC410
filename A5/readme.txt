HOW TO EXECUTE NuSUM

Navigate to A5/nusmv/bin folder, then type
    ./NuSMV -int soldiers.smv
    /u/csc410h/fall/pub/NuSMV-2.6.0-Linux/bin/NuSMV -int soldiers.smv

Then type "go" to compile

which saves u from typing the following
    {
        read_model -i q1.smv
        flatten_hierarchy
        encode_variables
        build_model
    }

Some other useful commands:
    pick_state -i

    simulate -i -k 15

    print_reachable_states -v

    show_traces -v

Command to check ltl spec:
    check_ltlspec -p "G (x >= 0)"
    check_ltlspec -p "F (x >= 5)"
    check_ltlspec -p "G (request = TRUE -> F status = busy)"

    check_ltlspec -p "F (all_crossed = TRUE)"
    check_ltlspec -p "G (total_time <= 60 -> F (status[0] = waiting_end & status[1] = waiting_end & status[2] = waiting_end & status[3])= waiting_end)"