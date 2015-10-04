class Book
    def title
        puts "title"
    end

    def subtitle
        puts "subtitle"
    end
    
    def lend_to(user)
        puts "Lending to #{user}"
    end

    # it is a class marco
    def self.deprecate(old_method,new_method)
        define_method(old_method) do |*args,&block|
            warn "Warning: #{old_method}() is deprecate. Use #{new_method}()."
            send(new_method,*args,&block)
        end
    end

    deprecate :GetTitle,:title
    deprecate :LEND_TO_USER,:lend_to
    deprecate :title2, :subtitle
end

book = Book.new
book.GetTitle
