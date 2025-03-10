class Application
    
    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)

            item_name = req.path.split("/items/").last
            item = @@items.find do |item|
                item.name == item_name
            end

            if item == nil
                resp.write "Item not found"
                resp.status = 400
            else
                resp.write "#{item.price}"
            end
        elsif
            resp.write "Route not found"
            resp.status = 404
        end
    resp.finish
    end
end