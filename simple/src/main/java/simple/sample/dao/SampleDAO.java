package simple.sample.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import simple.common.dao.AbstractDAO;

@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO
{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selecBoardList(Map<String, Object> map)
	{
		return (List<Map<String, Object>>)selectList("sample.selectBoardList", map);
	}
	
}
