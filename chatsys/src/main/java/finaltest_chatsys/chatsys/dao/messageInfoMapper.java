package finaltest_chatsys.chatsys.dao;

import finaltest_chatsys.chatsys.entity.Info;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface messageInfoMapper {
    public void insertToUnprocessed(Info info,String userId);
    public void insertToLog(Info info,String userId);
    public List<Info> select(String userId,String tarId);
    public void delete(String userId,String tarId);
}
