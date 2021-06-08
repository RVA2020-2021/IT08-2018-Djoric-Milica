package rva.ctrls;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import rva.jpa.Grupa;
import rva.jpa.Smer;
import rva.repository.GrupaRepository;
import rva.repository.SmerRepository;

@CrossOrigin
@RestController
@Api(tags = { "Grupa CRUD operacije" })
public class GrupaRestController {
	@Autowired
	private GrupaRepository grupaRepository;

	@Autowired
	private SmerRepository smerRepository;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@GetMapping("grupa")
	@ApiOperation(value = "Vraca kolekciju svih grupa iz baze podataka.")
	public Collection<Grupa> getGrupe() {
		return grupaRepository.findAll();
	}

	@GetMapping("grupa/{id}")
	@ApiOperation(value = "Vraca grupu u odnosu na prosledjenu vrednost path varijable id.")
	public Grupa getGrupa(@PathVariable("id") Integer id) {
		return grupaRepository.getOne(id);
	}

	@GetMapping("grupeZaSmerID/{id}")
	@ApiOperation(value = "Vraca grupu u odnosu na posledjenu vrednost path varijable id.")
	public Collection<Grupa> getGrupePoSmerID(@PathVariable("id") Integer id) {
		Smer s = smerRepository.getOne(id);
		return grupaRepository.findBySmer(s);

	}

	@PostMapping("grupa")
	@ApiOperation(value = "Dodaje novu grupu u bazu podataka.")
	public ResponseEntity<Grupa> insertGrupa(@RequestBody Grupa grupa) {
		if (!grupaRepository.existsById(grupa.getId())) {
			grupaRepository.save(grupa);
			return new ResponseEntity<Grupa>(HttpStatus.OK);
		}
		return new ResponseEntity<Grupa>(HttpStatus.CONFLICT);
	}

	@PutMapping("grupa")
	@ApiOperation(value = "Update-uje postojecu grupu.")
	public ResponseEntity<Grupa> updateGrupa(@RequestBody Grupa grupa) {
		if (!grupaRepository.existsById(grupa.getId()))
			return new ResponseEntity<Grupa>(HttpStatus.NO_CONTENT);
		grupaRepository.save(grupa);
		return new ResponseEntity<Grupa>(HttpStatus.OK);
	}

	@DeleteMapping("grupa/{id}")
	@ApiOperation(value = "Brise grupu u odnosu na vrednost posledjene path varijable id.")
	public ResponseEntity<Grupa> deleteGrupa(@PathVariable("id") Integer id) {
		if (!grupaRepository.existsById(id)) {
			return new ResponseEntity<Grupa>(HttpStatus.NO_CONTENT);
		}
		jdbcTemplate.execute("delete from student where grupa = " + id);
		grupaRepository.deleteById(id);
		if (id == -100) {
			jdbcTemplate
					.execute("INSERT INTO \"grupa\"(\"id\", \"oznaka\", \"smer\")" + "VALUES (-100, 'Oz test', '1')");
		}
		return new ResponseEntity<Grupa>(HttpStatus.OK);
	}
}
