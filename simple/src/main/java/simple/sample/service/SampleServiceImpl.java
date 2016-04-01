package simple.sample.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import simple.sample.dao.SampleDAO;

@Service("sampleService")
public class SampleServiceImpl implements SampleService
{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="sampleDAO")
	private SampleDAO sampleDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception
	{
		return sampleDAO.selecBoardList(map);
	}
	
	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception
	{
		sampleDAO.updateHit(map);
		return sampleDAO.selecBoardDetail(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map) throws Exception
	{
		sampleDAO.insertBoard(map);
	}
}
