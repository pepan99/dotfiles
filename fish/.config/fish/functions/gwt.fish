function gwt --description "Git worktree wrapper"
    switch $argv[1]
        case add
            git worktree add $argv[2..-1]
        case list
            git worktree list
        case remove rm
            git worktree remove $argv[2..-1]
        case '*'
            echo "Usage: gwt [add|list|remove] [args...]"
            echo ""
            echo "Examples:"
            echo "  gwt add ../myproject-feature feature/new-feature"
            echo "  gwt list"
            echo "  gwt remove ../myproject-feature"
    end
end
