import redis

# we can use redis to store connections of person as a key : value , where key is person's name and value will be set of person's friends.
# we can then iterate over person's and use redis's sinter (set intersection) to find common connections.
# This way we will be iterating over the person's only one time as compared to sql where we were doing cross join.
#Redis is also fast since all the data stored is in memory as compared to sql database where there will be a lot of I/o's.

class MutualFriends(object):

    def __init__(self , host , port):
 # creating connection to redis db , for simiplicity i have not added error handling.
            self.connection = redis.StrictRedis(
                    host=host,
                    port=port,
                    db=0
                )


    def mutual_friends(self, person1 , person2):
        mutual_connections = self.connection.sinter(person1,person2)

        return len(mutual_connections)


    def friend_list(self, key):
         return self.connection.smembers(key)




    def number_of_common_connections(self):
        common_connections = {}
# if keys more than we can iterate the keys in batches , however here I am iterating them one by one
        for person in self.connection.scan_iter("person:*") :
            for friend in self.connection.scan_iter("person:*"):
                if person == friend :
                    continue
                if friend+'-'+person in  common_connections  :
                    continue
                common_connections[person+'-'+friend] = len(self.mutual_friends())


        return common_connections


if __name__ == '__main__':
    host = 'localhost'
    port = '6667'

    a = MutualFriends(host,port)

    list_connection_pair = a.number_of_common_connections()





