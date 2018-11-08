package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.Notice;

public interface NoticeDao {
  List<Notice> findAll(Map<String,Object> params);

}