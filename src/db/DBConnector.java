package db;

import entity.Item;
import entity.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DBConnector {

    private static Connection connection;

    static {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/bitshop",
                    "postgres",
                    "Aldiyarxxx"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<Item> getItem() {
        List<Item> itemList = new ArrayList<>();
        try{
            PreparedStatement statement = connection.prepareStatement(
                    "select * from items");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Item item = new Item();
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("name"));
                item.setDescription(resultSet.getString("description"));
                item.setPrice(resultSet.getDouble("price"));
                itemList.add(item);
            }
            statement.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return itemList;
    }

    public static User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "select * from users where email = ? and password = ?");
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getLong("id"));
                user.setFullName(resultSet.getString("full_name"));
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
