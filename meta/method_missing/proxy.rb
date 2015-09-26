class Computer
    def initialize(computer_id,data_source)
        @id = computer_id
        @data_source = data_source
    end

    def method_missing(name,*args)
        super if !@data_source.respond_to?("get_#{name}_info")
        info = @data_source.send("get_#{name}_info",args[0])
        price = @data_source.send("get_#{name}_price",args[0])
        result = "* #{result}" if price >= 100
        result
    end

    def respond_to?(method)
        @data_source.respond_to?("get_#{method}_info") || super
    end
end

